# check disk usage

``` yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: disk-check
spec:
  selector:
    matchLabels:
      app: disk-check-app
  replicas: 1
  template:
    metadata:
      labels:
        app: disk-check-app
    spec:
      containers:
        - name: app
          image: s1s5/cron:check-disk-usage
          livenessProbe:
            exec:
              command:
                - check-liveness
            initialDelaySeconds: 120
            periodSeconds: 60
          env:
            - name: TARGET_PATH
              value: "/"
            - name: DISK_USAGE_THRESHOLD
              value: "80"
            - name: CRONTABS
              value: "*/30 * * * * /opt/check-disk-usage"
            - name: ON_SUCCESS
              value: "echo ok"
            - name: ON_FAILURE
              value: "echo ng"
```

