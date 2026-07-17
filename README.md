# NPM Supply Chain Attacks

```text
  +----------------------+      +----------------------+
  |                      |      |                      |
  |  Malicious Actor     |      |  Compromised         |
  |  (Attacker)          | ---> |  NPM Package / Repo  |
  |                      |      |                      |
  +----------------------+      +----------------------+
            |                              |
            | (publishes malware /         | (contains malicious
            |  steals credentials)         |  install scripts or code)
            v                              v
  +----------------------+      +----------------------+
  |                      |      |                      |
  |  Typosquatting /     |      |  Developer's         |
  |  Dependency Confusion| ---> |  Machine / CI/CD     |
  |                      |      |                      |
  +----------------------+      +----------------------+
                                           |
                                           | (npm install triggers
                                           |  malware execution)
                                           v
                                +----------------------+
                                |                      |
                                |  Stolen Secrets /    |
                                |  Compromised System  |
                                |                      |
                                +----------------------+
```
