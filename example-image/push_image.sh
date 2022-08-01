#!/usr/bin/env bash
echo docker image tag migrations-pg 127.0.0.1:8000/migrations-pg

echo docker image tag 127.0.0.1:8000/migrations-pg 127.0.0.1:8000/migrations-pg:taged-example-1
echo docker image tag 127.0.0.1:8000/migrations-pg 127.0.0.1:8000/migrations-pg:taged-example-2

echo docker push 127.0.0.1:8000/migrations-pg --all-tags