locals{
    departments = ["IT", "HR", "Design"]
    subnet_prefixes = "10.10"
    department_subnet = {
    for x, y in local.departments :

    y => "${local.subnet_prefixes}.${x+1}.0/24"    
    }
}