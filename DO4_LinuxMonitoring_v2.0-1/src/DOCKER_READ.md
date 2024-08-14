### commands

docker ps --format 'table {{.ID}}\t{{.Image}}\t{{.Command}}\t{{.Ports}}\t{{.Status}}' | cut -f 1,2,3,6,7

