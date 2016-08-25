{{- define "persistence.volume" -}}
      {{- if .Values.persistence.enabled -}}
        persistentVolumeClaim:
          claimName: {{ template "persistence.fullname" . }}
      {{- else -}}
        emptyDir: {}
      {{- end -}}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 24 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
This needs to be hardcoded as the context of `.` changes for the PVC template and the partial defined above
*/}}
{{- define "persistence.fullname" -}}
{{- printf "%s-%s" .Release.Name "pvc" | trunc 24 -}}
{{- end -}}
