# docker carbon

`docker build -t carbon .`

`docker run -v $PWD/hello.carbon:/hello.carbon carbon bazelisk run //explorer -- /hello.carbon`