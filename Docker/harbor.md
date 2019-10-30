# Harbor

## Troubleshooting

### Fail to login with docker cli

When harbor is behind reverse proxy and you can't login, you can edit `common/config/registry/config.yml` change realm from `http` to `https`

## Refs

- <https://github.com/goharbor/harbor/issues/5980#issuecomment-430135040>
