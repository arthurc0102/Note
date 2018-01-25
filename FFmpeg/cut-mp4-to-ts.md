# Cut mp4 to ts

> 10 second a file

```sh
ffmpeg -i big.mp4 -codec: copy -start_number 0 -hls_time 10 -hls_list_size 0 -f hls output/output.m3u8
```
