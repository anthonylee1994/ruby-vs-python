class TimestampMixin:
    def timestamp(self):
        return "2026-06-10T12:00:00Z"


class JsonSerializableMixin:
    def to_json_dict(self):
        return self.__dict__


class AuditEvent(TimestampMixin, JsonSerializableMixin):
    def __init__(self, action, user):
        self.action = action
        self.user = user

    def summary(self):
        return f"{self.user} did {self.action} at {self.timestamp()}"


event = AuditEvent("login", "Ada")

print(event.summary())
print(event.to_json_dict())

print("---")


class AdminAuditEvent(AuditEvent):
    def summary(self):
        return f"[ADMIN] {super().summary()}"


admin_event = AdminAuditEvent("delete-user", "Grace")

print(admin_event.summary())
