output "aws_subnet" {

    value = aws_subnet.project-public_subnet.id

}

output "aws_security_group" {

    value = aws_security_group.project-sg.id

}