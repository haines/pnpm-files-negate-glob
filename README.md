# pnpm doesn't handle negated glob patterns in subdirectories?

[`packages/files-negate-glob`](./packages/files-negate-glob/package.json) defines `files` as

```json
[
  "one/two",
  "!one/two/**/*.d.ts",
  "three",
  "!three/**/*.d.ts"
]
```

However, `pnpm deploy` and `pnpm pack` only exclude the `.d.ts` files from the `three` directory.

```console
$ ./run
==> pnpm deploy

./one/two/index.d.ts
./one/two/index.js
./package.json
./three/index.js


==> pnpm pack

files-negate-glob-1.0.0.tgz
package/one/two/index.d.ts
package/one/two/index.js
package/package.json
package/three/index.js


==> npm pack

files-negate-glob-1.0.0.tgz
package/one/two/index.js
package/package.json
package/three/index.js
```
