def log_call(function):
    def wrapper(*args, **kwargs):
        print(f"Calling {function.__name__}")
        result = function(*args, **kwargs)
        print(f"Finished {function.__name__}")

        return result

    return wrapper


@log_call
def total(items):
    return sum(items)


print(total([10, 20, 30]))

print("---")


class Retry:
    def __init__(self, attempts):
        self.attempts = attempts

    def run(self, function):
        last_error = None

        for attempt in range(1, self.attempts + 1):
            try:
                return function()
            except RuntimeError as error:
                last_error = error
                print(f"Attempt {attempt} failed")

        raise last_error


counter = {"count": 0}


def sometimes_fails():
    counter["count"] += 1

    if counter["count"] < 2:
        raise RuntimeError("Not ready")

    return "OK"


print(Retry(attempts=3).run(sometimes_fails))
