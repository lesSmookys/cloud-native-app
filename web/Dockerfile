#BUILD
FROM golang:1.16-alpine as builder

COPY dispatcher.go .

RUN go build dispatcher.go

#RUN

#TOUJOURS PRECISER UNE VERSION / TAG
FROM alpine:3.16.0

EXPOSE 80
CMD [ "/dispatcher" ] 

COPY --from=builder /go/dispatcher /
COPY /static /static/





