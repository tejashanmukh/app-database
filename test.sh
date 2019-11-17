if [ $(docker container ls -q -a --filter name=test_c) != '' ]; then
    docker container stop test_c
    docker container rm test_c
fi

# remove the image if exists
if [ $(docker image ls -q --filter reference=test) != '' ]; then
    docker image rm test
fi

# build the image
docker build -t test .

# start the container
docker run -itd -p 9099:3306 --name test_c test
