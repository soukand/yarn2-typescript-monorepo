# yarn2-typescript-monorepo
Example repository about how to set up yarn monorepo with application and packages using typescript.

## First time here?
To start lets install all the dependencies and build the source
```sh
yarn
yarn build
```
You are now good to go
When accessing `.ts or .svelte` files VS code asks you to allow typescript version from workspace.



You need to set VScode setting:
```json
{
    "svelte.language-server.ls-path": ".yarn/sdks/svelte-language-server/bin/server.js"
}
```
https://github.com/sveltejs/language-tools/issues/1051

## Steps taken to create it
Initialize yarn project
```sh
yarn init -2
```

Setting up workspaces by adding following to package.json
```sh
{
    "private": true,
    "workspaces": [
        "applications/*",
        "packages/*"
    ]
}
```

Create an application my-api and package logger
```sh
mkdir applications/my-api
mkdir packages/logger

cd applications/my-api
yarn init

cd ..

cd packages/logger
yarn init
```

Configuring typescript for the project for VScode editor.
https://yarnpkg.com/getting-started/editor-sdks#vscode
```sh
yarn add -D typescript
yarn dlx @yarnpkg/sdks vscode
yarn plugin import typescript
```

Cannot use eslint 8 until this issue is fixed
https://github.com/yarnpkg/berry/issues/3578

**IMPORTANT** After you add library to root that is used by VScode editor you need to execute `yarn dlx @yarnpkg/sdks vscode` command
https://yarnpkg.com/getting-started/editor-sdks#editor-setup

Implementing constraints.
`yarn plugin import constraints`

Constraints can be found from `constraints.pro`
