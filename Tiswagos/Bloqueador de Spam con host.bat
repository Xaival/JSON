@echo off
title Bloqueador de Spam con host
mode con:cols=65 lines=16

:Menu
  cls
  echo. --------------------------------------------------------------
  echo. --------------------------  MENU  ----------------------------
  echo. --------------------------------------------------------------
  echo.
  echo.                     Es necesario ejecutar como administrador
  echo.
  echo.
  echo.    1) Agregar o actualizar
  echo.    2) Desactivar
  echo.    3) Salir
  echo.
  echo.
  echo.
  set /P Opcion= Que deseas hacer:

  IF "%Opcion%" == "1" goto :Agregar
  IF "%Opcion%" == "2" goto :Desactivar
  IF "%Opcion%" == "3" goto :EOF
  IF "%Opcion%" == ""  goto :Menu


:Desactivar
  REM Vaciar consola
  cls

  REM Crear otro archivo sin las lineas con #AntiSpam
  type %systemroot%\System32\drivers\etc\hosts | findstr /V "#AntiSpam" > %TMP%\host_temp

  REM Meter el host_temp dentro del original
  type %TMP%\host_temp > %systemroot%\System32\drivers\etc\hosts


  echo.
  echo. Si no hay ningun texto superior a este.
  echo. se ha desacativado con exito.
  pause>nul
  goto :EOF


:Agregar
  REM Vaciar consola
  cls

  REM Crear otro archivo sin las lineas con #AntiSpam
  type %systemroot%\System32\drivers\etc\hosts | findstr /V "#AntiSpam" > %TMP%\host_temp

  REM Meter el host_temp dentro del original
  type %TMP%\host_temp > %systemroot%\System32\drivers\etc\hosts

  REM Borrar host_temp
  del /f /q %TMP%\host_temp

  REM Añadir nuevas lineas dentro del host >> para agregar
  echo. >> %systemroot%\System32\drivers\etc\hosts
  echo. >> %systemroot%\System32\drivers\etc\hosts
  echo #REF!>>%systemroot%\System32\drivers\etc\hosts \n


  echo.
  echo. Si no hay ningun texto superior a este
  echo. se ha agregado con exito.
  pause>nul
  goto :EOF