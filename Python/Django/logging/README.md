# Django log to file settings


```python
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse',
        },
    },
    'formatters': {
        'file_format': {
            '()': 'django.utils.log.ServerFormatter',
            'format': '[%(server_time)s]\n%(message)s\n',
        }
    },
    'handlers': {
        'file': {
            'level': 'INFO',
            'class': 'logging.handlers.TimedRotatingFileHandler',
            'filters': ['require_debug_false'],
            'formatter': 'file_format',
            'filename': path.join(LOG_PATH, LOG_FILE_NAME),
            'when': 'midnight',
            'interval': 1,
            'backupCount': 30
        },
    },
    'loggers': {
        'log_to_file': {
            'handlers': ['file'],
        },
    }
}
```
