@echo off

Set PROJ_DIR=%CD%
set "PROJ_DIR=%PROJ_DIR:\=/%"

set /p PENTAHO_INSTALL="Pentaho installation folder (C:\Pentaho): "
set /p PENTAHO_PORT="Pentaho port (8080): "
set /p POSTGRES_PORT="Postgres port (5432): "

IF NOT DEFINED PENTAHO_INSTALL SET PENTAHO_INSTALL="C:\Pentaho"
IF NOT DEFINED PENTAHO_PORT SET PENTAHO_PORT="8080"
IF NOT DEFINED POSTGRES_PORT SET POSTGRES_PORT="5432"

rem clone the repos 
git clone https://github.com/joreilly/pentaho_project_common.git common
git clone https://github.com/joreilly/pentaho_project_configuration.git configuration
git clone https://github.com/joreilly/pentaho_project_sales_dwh.git sales_dwh
git clone https://github.com/joreilly/pentaho_project_data_export.git data_export


rem now we will update kettle.properties and spoon.bat
cd configuration

set back=%cd%
for /d %%i in (%cd%\config-*) do (
cd "%%i"
powershell -Command "(gc spoon.bat) -replace 'pentaho_install_to_modify', '%PENTAHO_INSTALL%' | Out-File -Encoding ASCII spoon.bat"
cd .kettle
powershell -Command "(gc kettle.properties) -replace 'project_dir_to_modify', '%PROJ_DIR%' | Out-File -Encoding ASCII kettle.properties"
powershell -Command "(gc kettle.properties) -replace 'pentaho_port', '%PENTAHO_PORT%' | Out-File -Encoding ASCII kettle.properties"
powershell -Command "(gc kettle.properties) -replace 'postgres_port', '%POSTGRES_PORT%' | Out-File -Encoding ASCII kettle.properties"
cd "%%i"
cd properties
powershell -Command "(gc common.properties) -replace 'postgres_port', '%POSTGRES_PORT%' | Out-File -Encoding ASCII common.properties"
powershell -Command "(gc sales_dwh.properties) -replace 'postgres_port', '%POSTGRES_PORT%' | Out-File -Encoding ASCII sales_dwh.properties"
)
cd %back%