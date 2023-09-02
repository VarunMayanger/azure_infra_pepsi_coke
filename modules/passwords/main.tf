resource "random_password" "sql_db" { 
    length            = 16 	
    special           = true 	
    min_special       = 5 	
    override_special  = "!^&*()-_=+[]<>:?" 	 	
    keepers           = { 
        pass_version = 1 
        } 
    } 
