### Block Producer healthcheck TEMPLATES ###

{{/*
block-producer startup probe settings
*/}}
{{- define "healthcheck.blockProducer.startupProbe" }}
{{- include "healthcheck.daemon.startupProbe" . }}
{{- end }}

{{/*
block-producer liveness settings
*/}}
{{- define "healthcheck.blockProducer.livenessCheck" }}
{{- include "healthcheck.daemon.livenessCheck" . }}
{{- end }}

{{/*
block-producer readiness settings
*/}}
{{- define "healthcheck.blockProducer.readinessCheck" }}
readinessProbe:
  exec:
    command: [
      "/bin/bash",
      "-c",
      "source /healthcheck/utilities.sh && isDaemonSynced && peerCountGreaterThan 0 && ownsFunds"
    ]
{{- end }}

{{/*
ALL block-producer healthchecks - TODO: readd startupProbes once clusters k8s have been updated to 1.16
*/}}
{{- define "healthcheck.blockProducer.allChecks" }}
{{- if .healthcheck.enabled }}
{{- include "healthcheck.blockProducer.livenessCheck" . }}
{{- include "healthcheck.blockProducer.readinessCheck" . }}
{{- end }}
{{- end }}
