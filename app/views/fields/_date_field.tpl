{markdown}{literal}
ATK14 comes with three fields for inputting time.

#### DateField

Into this field you can input just a date. Valid output of this field is a date in ISO format (e.g. "2016-01-22")

DateField is expecting an localized date (e.g. "01/22/2016" in English)

Localization is done by gettext, which is a little limited but simple method. In the given *.po file (e.g. locale/en_US/LC_MESSAGES/messages.po for English) you can find a message ```atk14.parse_date_pattern``` which is translated to ```/^(?<month>[0-9]{1,2})\\/(?<day>[0-9]{1,2})\\/(?<year>[0-9]{4})$/``` And that's it.

#### DateTimeField

DateTimeField is field for inputting a date with hours and minutes.

Localization parse string ```atk14.parse_datetime_pattern``` is ```/^(?<month>[0-9]{1,2})\\/(?<day>[0-9]{1,2})\\/(?<year>[0-9]{4}) (?<hours>[0-9]{2}):(?<minutes>[0-9]{2})$/``` for English.

#### DateTimeWithSecondsField

DateTimeWithSecondsField is field for inputting a date with hours, minutes and seconds.

Localization parse string ```atk14.parse_datetime_with_seconds_pattern``` is ```/^(?<month>[0-9]{1,2})\\/(?<day>[0-9]{1,2})\\/(?<year>[0-9]{4}) (?<hours>[0-9]{2}):(?<minutes>[0-9]{2}):(?<seconds>[0-9]{2})$/``` for English.

Check out all the three fields in the following example.

{/literal}{/markdown}
