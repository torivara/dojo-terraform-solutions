# Solutions

These are the solutions to the exercises provided.

## 1. Create an Output Value

```hcl
variable "user_name" {
  type    = string
  default = "Alice"
}

output "greeting_message" {
  value = "Hello, ${var.user_name}!"
}
```

## 2. Define a Map with Authors and Their Books

```hcl
variable "authors_and_books" {
  type = map(list(string))
  default = {
    "J.K. Rowling"    = ["Harry Potter and the Sorcerer's Stone", "Harry Potter and the Chamber of Secrets"],
    "J.R.R. Tolkien"  = ["The Hobbit", "The Lord of the Rings"],
    "George Orwell"   = ["1984", "Animal Farm"]
  }
}

output "authors_books_output" {
  value = [for author, books in var.authors_and_books : "${author}: ${books}"]
}
```

## 3. Create a List and Display Its Contents

```hcl
variable "superheroes" {
  type    = list(string)
  default = ["Superman", "Batman", "Wonder Woman"]
}

output "superheroes_list" {
  value = [for hero in var.superheroes : "Superhero: ${hero}"]
}
```

## 4. Use Conditional Expressions

```hcl
variable "environment" {
  type    = string
  default = "dev"
}

output "deployment_message" {
  value = var.environment == "prod" ? "Deploying to Production" : "Deploying to Development"
}
```

## 5. Combine Two Lists with a Function

```hcl
variable "list_one" {
  type    = list(string)
  default = ["Apple", "Banana"]
}

variable "list_two" {
  type    = list(string)
  default = ["Carrot", "Date"]
}

output "combined_lists" {
  value = concat(var.list_one, var.list_two)
}
```

## 6. Find the Largest Number in a List

```hcl
locals {
  numbers = [10, 20, 15, 30, 25]
}

output "largest_number" {
  value = max(local.numbers)
}
```

## 7. Sort a List of Numbers

```hcl
locals {
  numbers = [10, 20, 15, 30, 25]
}

output "sorted_numbers" {
  value = sort(local.numbers)
}
```

## 8. Run a Local Script with Terraform

For Bash:
```bash
# hello.sh
echo "Hello, Terraform!"
```

For PowerShell:
```powershell
# hello.ps1
Write-Output "Hello, Terraform!"
```

Terraform configuration:
```hcl
resource "null_resource" "run_script" {
  provisioner "local-exec" {
    command = "bash hello.sh" # or "powershell ./hello.ps1" for PowerShell
  }
}
```

## 9. Work with a Local JSON File

JSON File (`config.json`):
```json
{
  "application": "MyApp",
  "version": "1.0.0"
}
```

Terraform configuration:
```hcl
locals {
  config_data = jsondecode(file("${path.module}/config.json"))
}

output "application_version" {
  value = local.config_data.version
}
```

**Follow-up for Exercise 9:**
Changing the `version` in `config.json` and re-applying the Terraform configuration will not inherently cause Terraform to reapply resources unless those changes are directly tied to resource attributes managed by Terraform. However, outputs will reflect the new values upon re-application. Terraform's state file does not track changes in external files like JSON config unless those changes affect the management of resources or outputs.

## 10. More fun with maps

### 1. Define maps

First, we define two maps, one for DC superheroes and another for Marvel superheroes.

```hcl
variable "dc_superheroes" {
  description = "Map of DC superheroes"
  type        = map(string)
  default     = {
    "Superman"    = "Clark Kent"
    "Batman"      = "Bruce Wayne"
    "Wonder Woman"= "Diana Prince"
  }
}

variable "marvel_superheroes" {
  description = "Map of Marvel superheroes"
  type        = map(string)
  default     = {
    "Spider-Man" = "Peter Parker"
    "Iron Man"   = "Tony Stark"
    "Thor"       = "Thor Odinson"
  }
}
```

### 2. Combine maps

Combine both maps into a single map to simplify some operations.

```hcl
locals {
  all_superheroes = merge(var.dc_superheroes, var.marvel_superheroes)
}
```

### 3. Some exercises

#### Exercise 1: List All Superheroes

**Task:** Generate a list of all superhero names.

```hcl
output "all_superhero_names" {
  value = keys(locals.all_superheroes)
}
```

#### Exercise 2: Filter Superheroes by Name Length

**Task:** Create a list of superheroes whose names are shorter than 10 characters.

```hcl
output "short_name_superheroes" {
  value = [for name in keys(locals.all_superheroes) : name if length(name) < 10]
}
```

#### Exercise 3: Find the Alter Ego of a Given Superhero

**Task:** Write a Terraform configuration that accepts a superhero name as an input and outputs the alter ego of that superhero.

```hcl
variable "search_superhero" {
  description = "The superhero name to find the alter ego for"
  type        = string
  default     = "Thor"
}

output "superhero_alter_ego" {
  value = lookup(locals.all_superheroes, var.search_superhero, "Unknown Superhero")
}
```

#### Exercise 4: Group Superheroes by Universe

**Task:** Given a list of superhero names, categorize each superhero by their universe (DC or Marvel).

This task requires a more complex Terraform configuration that isn't straightforward due to Terraform's declarative nature and its focus on infrastructure. Instead, consider this a conceptual challenge that might involve using external data processing tools or scripts for more complex logic beyond basic data manipulation.