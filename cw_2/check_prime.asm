TODO remove
check_is_prime: ; function that checks if number in eax is a prime number
  mov [check_is_prime_number], eax ; kopiujemy liczbę do zachowania
  cmp eax, 2 ; 2 zostałaby przez pętle wyłapana
  je found_prime

  start_checking:
    mov ecx, 2    ; zaczynamy sprawdzanie od 2

  while_check_number:
    mov eax, [check_is_prime_number]  ; ustawiamy number
    mov edx, 0 ; resetujemy resztę
    div ecx  ; dzielimy -reszta z dzielenia jest w edx

    cmp edx, 0
    je found_not_prime ; jeżeli reszta z dzielenia jest zerem to nie jest pierwsza

    inc ecx ; ecx++;
    cmp ecx, [check_is_prime_number]  ; jeżeli exc ma wartość ebx to liczba jest pierwsza
    jge found_prime

    jmp while_check_number

  found_prime:
    mov ebx, 1
    jmp check_is_prime_done

  found_not_prime:
    mov ebx, 0
    jmp check_is_prime_done

  check_is_prime_done:
    ret ; the result is stored in ebx
