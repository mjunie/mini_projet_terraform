
Auteur : Macougoum Junie

Contexte : Bootcamp DevOps - promotion 15

Centre de formation : eazytraining.fr

Date de publication : le 16 Avril 2024

LinkedIn : https://www.linkedin.com/in/

---
# MIni projet terraform
- Enoncé

    ![Tux, the Linux mascot](/images/tpterraform.png)

# Infrastructure as Code avec Terraform

- Infrastructure

    ![Tux, the Linux mascot](/images/illustration.png)
  
Ce projet utilise Terraform pour déployer une application web sur AWS, en provisionnant une instance EC2 avec Ubuntu Bionic, un volume EBS, une adresse IP publique et un groupe de sécurité.

## Structure du Projet

Le projet est divisé en modules réutilisables pour faciliter la gestion et la maintenance de l'infrastructure :

- `modules/ebs_module: Définit un volume EBS.
- `modules/ec2_module: Configure une instance EC2 avec Ubuntu Bionic, installe nginx et utilise une clé SSH pour l'accès.
- `modules/public_ip_module: Assigne une adresse IP publique à l'instance EC2 et enregistre cette adresse dans `ip_ec2.txt`.
- `modules/sg_module: Crée un groupe de sécurité qui autorise le trafic HTTP, HTTPS et SSH.
- `app`: Dossier contenant la configuration de l'application qui utilise les modules pour déployer l'instance EC2.

## Prérequis

- Terraform v0.12+ installé sur votre machine locale.
- AWS CLI configuré avec les identifiants appropriés.
- Un bucket S3 pour le backend de Terraform (déjà créé puis configuré dans `app/main.tf`).
- Une clé SSH nommée `devops-junie` doit être disponible et configurée dans AWS.

## Démarrage Rapide

1. Clonez ce dépôt sur votre machine locale.

    ```
    git clone https://github.com/mjunie/mini_projet_terraform.git
    ```

2. Assurez-vous que vos identifiants AWS sont configurés correctement.

   Rassurez vous de bien renseigner  access_key = "PUT YOUR OWN"  et secret_key = "PUT YOUR OWN" qui se trouvent dans le fichier main.tf du dossier app

4. Naviguez dans le dossier du projet (**app**) et initialisez Terraform avec la commande :

   ```sh
   terraform init
   ```

5. Appliquez la configuration Terraform :

   ```sh
   terraform apply
   ```

6. Confirmez les actions proposées par Terraform lorsque vous y êtes invité en saisissant (**yes**)

## Configuration

Les variables par défaut sont définies dans les fichiers `variables.tf` de chaque module. Pour personnaliser ces variables, je les ai surchargé dans `app/main.tf` à l'appel des modules. Vous pouvez créez un fichier `terraform.tfvars` dans le dossier `app` ou passez des variables directement via la ligne de commande.

Exemple de contenu pour `app/terraform.tfvars` :

```hcl
instancetype = "t2.micro"
ebs_size = 30
sg_name = "app-sg"
```

## Outputs

Après l'exécution, Terraform affichera les ID des ressources créées, y compris l'ID de l'instance EC2 et le nom du groupe de sécurité. Vous trouverez également l'adresse IP publique de l'instance dans le fichier `app/ip_ec2.txt`.

## Nettoyage

Pour détruire l'infrastructure créée par Terraform (et éviter des frais supplémentaires), exécutez :

```sh
terraform destroy
```

## Sécurité

- Ne versionnez jamais vos clés privées ou vos fichiers d'état Terraform.

## Sauvegarder de l'état de l'infrastructure

  Dans le but de faciliter le travail en équipe vous pouvez directement sauvegarder votre infrastructure sur aws comme nous avons fait dans la section *terraform backend* du fichier main.tf qui se trouve dans le dossier *app* 

## appercu du resultat

- EC2 instance.

    ![Tux, the Linux mascot](/images/ec2.png)
- Ngnix.

    ![Tux, the Linux mascot](/images/resultterraform.png)
  
  ## Support

Si vous rencontrez des problèmes ou avez des questions, veuillez ouvrir une issue dans le dépôt du projet.
