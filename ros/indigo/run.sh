#!/bin/sh

main()
{
  rocker --x11 --user --home ros-indigo --devices /dev/dri/card0
}

main "$@"
