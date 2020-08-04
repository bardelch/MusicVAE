build:
	docker build -t bardelch/musicvae-conda:rc1-gpu -f Dockerfile .

push:
	docker push bardelch/musicvae-conda:rc1-gpu

run:
	docker run -it -p 49193:8888 -v `pwd`:/work -v `pwd`/../clean_midi:/work/clean_midi bardelch/musicvae-conda:rc1-gpu ./jupyter_run.sh

.PHONY: run build
