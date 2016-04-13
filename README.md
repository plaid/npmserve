# npmserve

[![npm](https://img.shields.io/npm/v/npmserve.svg?maxAge=2592000)]()

A replacement for `npm`, which allows clients to execute `npm install` on a remote server.
This allows slow clients to offload the work of building `node_modules` and perform significantly faster installs.

## server

The client provided in this repository communicates with an [npmserve-server](https://github.com/plaid/npmserve-server).

## disclaimer

`npmserve` and `npmserve-server` are experimental projects. These tools should not be used for deploying production dependencies. The client/server model does not yet have authentication or authorization in place. This project also does not guarantee the integrity or security of dependencies installed from npm or distributed to clients. Please consider your own requirements and constraints before incorporating `npmserve` into your workflow.

## implementation

The client/server model works by uploading the module's `package.json` contents.
The server creates a build hash from the package.json, which is used to
store, delete, and retrieve builds.

## limitations

Currently, the server must be run on a machine with the same architecture as the clients. If this is not the case, calls to `/npm/install` may return `node_modules` archives that contain extensions compiled for the wrong architecture.

## installation

```
npm install -g npmserve
```

For convenience, you might want to configure the `NPMSERVE_ORIGIN`
environment variable in your `.profile` or `.bashrc`:

```
export NPMSERVE_ORIGIN=<your_server_url>
```

This will allow you to execute the commands as shown below, without having to
specify the `NPMSERVE_ORIGIN` on each command.

## usage

The commands consist of a list of commands analogous to actions a user takes
when running standard `npm`:

`npm install` is replaced by:
```
npmserve install
```

`rm -rf node_modules/*` is replaced by:
```
npmserve remove
```

`npm cache clean` is replaced by:
```
npmserve cache clean
```

We also provide a command to print out the build hash and other information.
This is useful for looking up your build in the [npmserve-server](https://github.com/plaid/npmserve-server) web interface.
```
npmserve info
```

## environment

This project relies on the following environment variables:

| name | type | default | description |
| ---- | ---- | ------- | ----------- |
| `NPMSERVE_ORIGIN` | string | | endpoint for the `npmserve-server` |
