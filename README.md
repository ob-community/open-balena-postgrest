# Postgrest Implementation for Open Balena

Open source postgrest implementation for [openbalena](https://github.com/balena-io/open-balena), a platform to deploy and manage connected devices.

## Features

The goal of this project is to provide a rest interface to the `open-balena` postgres database, allowing use by the `open-balena-ui` component of `open-balena-admin`.  It provides access to the various tables within `open-balena` in a standardized way, enabling the `react-admin` dataprovider to do its thing.

## Compatibility

This project is compatible with `open-balena` and specifically relies on either the `open-balena-db` component or another working postgres database that is being utilized by an `open-balena` instance.

## Installation

`open-balena-postgrest` is meant to be installed as part of [open-balena-admin](https://github.com/obcommunity/open-balena-admin). For thoes running `open-balena` on k8s, we have included services to build it in the [open-balena helm project](https://github.com/obcommunity/open-balena-helm). If you are running `open-balena` via docker-compose, you will need to modify the scripts to mirror the setup in the helm charts or recreate it using the configuration steps below.

To configure `open-balena-postgrest` you must define three (optionally four) environment variables for the container:

Environment Variables:

- **PGRST_DB_URI**: The uri for your postgres database, i.e. postgres://<dbuser>:<dbpass>@<dbhost>:5432/<dbname>
- **PGRST_DB_SCHEMA**: The schema within your postgres database, i.e. public (this is the default if not specified)
- **PGRST_JWT_SECRET**: The JWT secret used by `open-balena-api` for signing tokens
- **OPENBALENA_DB_ROLE**: The postgres role to use for database access

## Usage

This internal component of [open-balena-admin](https://github.com/obcommunity/open-balena-admin) is not intended to be used on its own, but rather as a part of that package.

## Limitations and Known Issues

- Likely many; needs more testing to cover off corner cases
