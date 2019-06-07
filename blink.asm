.include "m328Pdef.inc"

; Set PB5 to an output
sbi DDRB, 5
; Set PB5 to HIGH (5V)
sbi PORTB, 5


_start:
  call _delay_1s
  cbi PORTB, 5
  call _delay_1s
  sbi PORTB, 5
  rjmp _start

_delay_1s:
  push r0
  push r16
  push r17
  push r18
  eor r0, r0
  ldi r18, 246
_long_delay_loop:
  dec r18
  eor r17, r17
_medium_delay_loop:
  inc r17
  eor r16, r16
_small_delay_loop:
  inc r16
  cp r16, r0
  brne _small_delay_loop
  cp r17, r0
  brne _medium_delay_loop
  cp r18, r0
  brne _long_delay_loop
  pop r18
  pop r17
  pop r16
  pop r0
  ret
