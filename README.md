# docker-fsl

- A container for FSL


## How to use this container

- cd to the working directory in which you have neuroimaging data

- Pull the image and mount working directory as /home/barin in the container

```
docker run -it --rm -v $PWD:/home/brain kytk/docker-fsl:6.0.6.2
```

- You can run FSL commands after cd to the home directory

```
cd # cd to /home/brain
```


