# About

[![Build](https://github.com/rgl/windows-dockerfile-copy-with-chown-test/actions/workflows/build.yml/badge.svg)](https://github.com/rgl/windows-dockerfile-copy-with-chown-test/actions/workflows/build.yml)

This tests whether the `COPY --chown` Dockerfile instruction really sets the file owner.

**this is still broken in docker 24.0.7. see https://github.com/moby/moby/issues/35507.**

## Usage

In a Windows machine, with Docker installed, execute:

```powershell
.\test.ps1
```
