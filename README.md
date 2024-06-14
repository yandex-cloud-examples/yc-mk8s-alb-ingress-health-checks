# Проверка доступности приложений Kubernetes

Вы можете регулярно проверять доступность и работоспособность приложений, которые развернуты в [кластере Yandex Managed Service for Kubernetes](https://yandex.cloud/ru/docs/managed-kubernetes/concepts/#kubernetes-cluster). Проверка реализуется с помощью Ingress-контроллера от сервиса [Yandex Application Load Balancer](https://yandex.cloud/ru/docs/application-load-balancer/concepts/).

Настройка описана в [практическом руководстве](https://yandex.cloud/ru/docs/managed-kubernetes/tutorials/custom-health-checks). В репозитории хранятся необходимые для настройки конфигурационные файлы:

* Папка `app` — содержит файлы, из которых формируется образ Docker и приложение Kubernetes.
* Папка `terraform-manifests` — содержит манифесты Terraform для создания нужной облачной инфраструктуры.
* Файл `httpbackendgroup.yaml` — используется для создания [группы бэкендов](https://yandex.cloud/ru/docs/application-load-balancer/concepts/backend-group).
* Файл `ingress.yaml` — используется для создания Ingress-контроллера.
