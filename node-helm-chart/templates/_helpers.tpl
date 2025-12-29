{{- define "backend.validateMode" -}}
{{- if .Values.backend.enabled -}}
  {{- if not .Values.backend.mode -}}
    {{- fail "ERROR: backend.mode is required when backend.enabled=true" -}}
  {{- end -}}
  {{- if and .Values.backend.mode.deployment .Values.backend.mode.statefulset -}}
    {{- fail "ERROR: Only one of backend.mode.deployment or backend.mode.statefulset can be true" -}}
  {{- end -}}
  {{- if and (not .Values.backend.mode.deployment) (not .Values.backend.mode.statefulset) -}}
    {{- fail "ERROR: One of backend.mode.deployment or backend.mode.statefulset must be enabled" -}}
  {{- end -}}
{{- end -}}
{{- end -}}

{{- define "postgres.validateMode" -}}
{{- if .Values.postgres.enabled -}}
  {{- if not .Values.postgres.mode -}}
    {{- fail "ERROR: postgres.mode is required when postgres.enabled=true" -}}
  {{- end -}}
  {{- if and .Values.postgres.mode.deployment .Values.postgres.mode.statefulset -}}
    {{- fail "ERROR: Only one of postgres.mode.deployment or postgres.mode.statefulset can be true" -}}
  {{- end -}}
  {{- if and (not .Values.postgres.mode.deployment) (not .Values.postgres.mode.statefulset) -}}
    {{- fail "ERROR: One of postgres.mode.deployment or postgres.mode.statefulset must be enabled" -}}
  {{- end -}}
{{- end -}}
{{- end -}}

