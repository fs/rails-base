### Variables

node.set[:application]     = "foobared"

# TODO: implement a class for adding (instead of replacing) ssh keys
node.set[:ssh_keys] = [
  'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAvvTJvlEEkANmgMFf+a7NTnJO3tl93NT27cOTDMRH0s5vXg8R7kBv6QQ2WcFE1b8h8UXYZ4QS6ChdgsQ5tOwHZLh4+rtklplZsBmD27j4oMR5d7CHBDD3jzesa9OohWr4VSgvCbda8fUcPyUrZMynmIrCIMV7bA6uvyzeOglLTG0tW0j0vSoOShLUzCy7rgrM93Ti0d5UJ1lL3szNeP2tuqRbWhN6k4+Lvoz6Px/LtAyqkIZpp8jL+sD9779Yr9aEJV8cZVtzCZe2oQBjUq9fXd8/T1kCu/ZOBs6ygJ/JlL6g/i1yNjDsjoKeSHoKF/dpQ+qvKvIsovs8NH8xcJq1/w== admin@tsweb.toa',
  'ssh-dss AAAAB3NzaC1kc3MAAAEBANXaNAmJ1JED5WpTJk0StJ3HEjSWwFWf6X80HgyrIYY6AdiFSbYiUDx+fKR5WRnfWrKqzcyPQ9wfLU9JjodwHurZFDxntPoDLGV/1wRMjr4qVuGhcahKSe0NY4X2y1kBsqr3F+oI4f47eCVe1iFfsbiE2TSVjS/VIbFiylJVPePZO/+gfd/UStEfS0GQUbm8WldKAKul46N4p4rWU3q0nG6BDgZAlvE56P+M4/1DCBsmLYq/nHsArcRhU9SsbGoON+seeM7B5wXSDAHFdNqNlesP+ZhgbGAR8g92kLUDLh+Qsi9261Av+g+7i2vuFF1MJCh7VgUZYdCmtHA+8EhgmZUAAAAVANBNhX/LkxvO3DbVauyRJsJqqCo/AAABABInFSWYZN1nITUUTrNA9yBxXTCZLJxvXW3RThZvKuXTNOTVWAkw4sEA/HMUxNH6QZ79I3S+QB0mi6jn1uxJEx4IdFz0T9VHg3cLPRqGOyzsla/YDCuC8cSQypXdzrc8JjART5SGuc9A35z0nUkm33ErMPAuK2fQ+dfELpo/D6gJikicCiB/EpTisExPrYF2xf4I1AnTOTcFmJ0ZGO8eh/eEFI8i6vcKX4mbnwNU0mEaOUijFnXmZSsH8eZpjmpnEGOqR1hyt4OFO+C9oPmQAslO2vIYJEeCHBWGKa35QDzBFo1iY7NiQqMgXLyyySYeE/1xd/o56nJPoswiTPvYWaUAAAEBAKsE4IS15mFiXDCrUSgnBle6n5ioY1SfBXlnWy6cE8vA+J9g1YYSgEoYCb5h4BU84GV1KmkNK0x7JdCiY5QbebV6ipsrBwd1cPWJ62q1Tfo/5k7qd+C98N4ShCc5L9bkfy/ylmXxQE/BQ0E7Zo3uemQLG3M9Rk3IV1fdzOwfvT4TmqZLhjWPaTOK8QDSRWX4Hz6ODJF5geQzBtKI3bAULUirlPPfBgrIo7mBiqfWUAAb3Q9fTe8g8f4Vc/0HGLBDiusDk+dDeF9B90LUDKuc4VVa+Kbo4PdE9HN7XqJuvmJeGNeEcgjFovZRJp9EYR2rXRfK+F0CdLPN2reXhs12vus= timurb.batyrshin@flatstack.ru'
]

node.set[:application_dir] = "#{node[:web_root]}/#{node[:application]}"

# node.set[:set_fqdn]     = "devbox.flatstack.com"  # Your server name here
# node.set[:ruby_version] = "1.9.3-p194"

include_recipe "flatstack"
