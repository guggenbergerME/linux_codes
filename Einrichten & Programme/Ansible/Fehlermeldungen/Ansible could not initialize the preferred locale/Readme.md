# Fehler

```
Ansible: resolving ‘could not initialize the preferred locale: unsupported locale setting’
```

This means Ansible cannot find a locale ending in “.UTF-8”.  Check the currently installed locales:
```
$ locale -a
```

Then export the LC_ALL variable to one of the locales ending in UTF-8
```
export LC_ALL=C.UTF-8
```

ansible should work now
```
ansible --version
```
