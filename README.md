# Descripción
Este conjunto de archivos de Terraform crea dos redes virtuales con tres subredes cada una y una máquina virtual en una de ellas. Los recursos se generan en una suscripción de Azure con el proveedor de AzureRM. El archivo main.tf tiene los recursos que se crean, el archivo variables.tf define las variables utilizadas por el archivo main.tf y el archivo de variables ejemplo contiene los valores por defecto para estas variables.

# Instrucciones
Antes de ejecutar el código, debe asegurarse de que tiene una suscripción de Azure y que ha autenticado su cuenta de Azure. Debe configurar Terraform con los datos de autenticación de Azure, lo que puede hacer mediante una de las siguientes opciones:

- Proporcionando credenciales de Azure como variables de entorno. Las variables necesarias son ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_SUBSCRIPTION_ID y ARM_TENANT_ID.
- Usando Managed Service Identity (MSI). Puede habilitar MSI para su instancia de Terraform y asignar el permiso necesario para que Terraform cree los recursos. Este código ya está configurado para usar MSI.

Para ejecutar el código, siga estos pasos:

1. Clonar este repositorio y moverse al directorio clonado.

``` 
git clone https://github.com/cristocabrera3/AzureSemana01.git 
cd AzureSemana01
```

2. Ejecutar el comando terraform init para inicializar el proyecto de Terraform y descargar los módulos necesarios.
``` 
terraform init
``` 

3. Ejecutar el comando terraform plan para ver los cambios que se realizarán. Asegúrese de revisar cuidadosamente estos cambios antes de continuar.
``` 
terraform plan
``` 

4. Ejecutar el comando terraform apply para crear los recursos de Azure. Este comando creará las redes virtuales y la máquina virtual. El comando pedirá confirmación antes de realizar cambios en Azure. Responda "yes" para continuar.
``` 
terraform apply
``` 

5. (Opcional) Ejecutar el comando terraform destroy para eliminar los recursos creados. Este comando pedirá confirmación antes de eliminar los recursos. Responda "yes" para continuar.
``` 
terraform destroy -var-file="variables.tfvars"
``` 

# Archivos
- main.tf: Define los recursos que se crean en Azure.
- variables.tf: Define las variables utilizadas por el archivo main.tf.

# Autor
Christopher Cabrera - cfcabrerat@unitru.edu.pe

# Notas
Este código es solo para fines educativos. No debe utilizarse en un entorno de producción sin una revisión cuidadosa.