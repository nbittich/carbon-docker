# docker carbon

## How to

### build the image
`docker build -t carbon .`

### run the hello world
`docker run -v $PWD/hello.carbon:/hello.carbon carbon bazelisk run //explorer -- /hello.carbon`