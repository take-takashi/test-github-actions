const config = {
  // prototyping
  prototype: {
    mode: 'prototype',
    baseurl: '/'
  },
  // local debug
  local: {
    mode: 'local',
    baseurl: '/'
  },
  // dev environment deploy
  development: {
    mode: 'development',
    baseurl: '/test-github-actions/'
  },
  // stage environment deploy
  staging: {
    mode: 'staging',
    baseurl: '/'
  },
  // prod environment deploy
  production: {
    mode: 'production',
    baseurl: '/'
  }
}

export {config}
