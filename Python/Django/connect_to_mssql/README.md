# Use Django and SQL Server

1. Install [django-pyodbc-azure](https://github.com/michiya/django-pyodbc-azure): `pip install django-pyodbc-azure`

2. Install ODBC Driver
    - Check this <https://docs.microsoft.com/zh-tw/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server>
    - For mac:
        - `brew tap microsoft/mssql-release https://github.com/Microsoft/homebrew-mssql-release`
        - `brew update`
        - `brew install msodbcsql mssql-tools`

3. Database setting in Django project
    ```python
    DATABASES = {
        'default': {
            'ENGINE': 'sql_server.pyodbc',
            'NAME': 'DjangoTest',
            'USER': 'sa',
            'PASSWORD': 'password',
            'HOST': '127.0.0.1',
            'PORT': '1433',
        }
    }
    ```
