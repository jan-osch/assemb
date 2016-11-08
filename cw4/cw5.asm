;; ŁADOWANIE:
.data
  x dd 4.1 ;tak zapisujemy liczby zmiennoprzecinkowe w pamieci
  ; liczby zmiennoprzecinkowe zapisujemy na 80 bitach w koprocesorze

.text
  fld dword [x] ; ładuje liczbe z x do pamieci FPU


;; ładowanie stałych

 fldz ; ładuje zero
 fld1 ; ładuje 1
