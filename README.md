![Static Badge](https://img.shields.io/badge/cloud-black?style=for-the-badge) ![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)

![Static Badge](https://img.shields.io/badge/IaC-black?style=for-the-badge) ![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)

# 🍔 Fast & Foodious - IaC Network ![Github Actions](https://github.com/rs-renato/fast-n-foodious-iac-network/actions/workflows/fnf-pipeline.yml/badge.svg?branch=main) ![Static Badge](https://img.shields.io/badge/v2.0.0-version?logo=&color=%232496ED&labelColor=white&label=fast-n-foodious-iac-network)
Sistema de auto-atendimento de fast food. Projeto de conclusão da Fase 05 da pós gradução em Software Architecture.

![fast-n-foodious-aws](https://github.com/rs-renato/fast-n-foodious-docs/blob/main/diagramas/png/fast-n-foodious-aws.png?raw=true)


## Recursos
Repositório de criação de infraestrutura cloud AWS, responsável por criar os seguintes recursos:

```
fast-n-foodious-iac-network
├── fnf-loadbalancer.tf                         # Definição de recurso Load Balancer
├── fnf-network.tf                              # Definição de recursos de rede
├── fnf-security-group.tf                       # Definição de recurso de segurança de rede
├── main.tf                                     # Definição de terraform providers e backend 
├── outputs.tf                                  # Definição de terraform outputs, necessários em módulos externos
```

## Links Externos
### Micro Serviços
- [fast-n-foodious-ms-produto](https://github.com/rs-renato/fast-n-foodious-ms-produto)
- [fast-n-foodious-ms-pagamento](https://github.com/rs-renato/fast-n-foodious-ms-pagamento)
- [fast-n-foodious-ms-pedido](https://github.com/rs-renato/fast-n-foodious-ms-pedido)

### IaC
- [fast-n-foodious-iac-network](https://github.com/rs-renato/fast-n-foodious-iac-network)
- [fast-n-foodious-iac-storage](https://github.com/rs-renato/fast-n-foodious-iac-storage)
- [fast-n-foodious-iac-compute](https://github.com/rs-renato/fast-n-foodious-iac-compute)

### Documentação
- [fast-n-foodious-docs](https://github.com/rs-renato/fast-n-foodious-docs)

### Sonar
- [fast-n-foodious-ms-produto](https://sonarcloud.io/summary/overall?id=fast-n-foodious-org_ms-produto)
- [fast-n-foodious-ms-pagamento](https://sonarcloud.io/summary/overall?id=fast-n-foodious-org_fast-n-foodious-ms-pagamento)
- [fast-n-foodious-ms-pedido](https://sonarcloud.io/summary/overall?id=fast-n-foodious-org_fast-n-foodious-ms-pedido)

### Monday
- [fast-n-foodious](https://fast-n-foodious.monday.com/workspaces/4361241)
