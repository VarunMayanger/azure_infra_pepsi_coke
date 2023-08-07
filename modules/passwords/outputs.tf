output "sql_password" {
  value = random_password.sql_db.result
}