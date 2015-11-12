# Changelog

## 2.2.1

- Only remove seq entries in array entries (GH #10)
- Resync value when exporting/unsetting (GH #10)

## 2.2.0

- Detect value in existing comment when uncommenting (GH #18)
- Improve README.md
- Use containerized Travis CI infrastructure
- Test on Puppet 4
- Update copyright

## 2.1.1

- Fix metadata.json

## 2.1.0

- Add multiline value support
- Depend on augeasproviders_core >= 2.1.0

## 2.0.4

- Fix Travis build

## 2.0.3

- Make sure :name is always fed by the composite namevar (GH #3)
- Always use resource[:variable] instead of resource[:name] in the provider

## 2.0.2

- Add target as namevar, activate composite namevars (GH #2)

## 2.0.1

- Fix exporting array values (GH #1)

## 2.0.0

- First release of split module.
