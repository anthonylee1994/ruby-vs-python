# Python asyncio 適合示範 async/await，同時處理多個等待中任務。
import asyncio
import time
from concurrent.futures import ThreadPoolExecutor


async def fetch_user(user_id):
    await asyncio.sleep(0.1)

    return {"id": user_id, "name": f"User {user_id}"}


async def main():
    users = await asyncio.gather(
        fetch_user(1),
        fetch_user(2),
        fetch_user(3),
    )

    print(users)


asyncio.run(main())

print("---")


# ThreadPoolExecutor 適合將 blocking function 放入 worker threads。
def slow_double(number):
    time.sleep(0.1)

    return number * 2


with ThreadPoolExecutor(max_workers=3) as executor:
    results = list(executor.map(slow_double, [1, 2, 3]))

print(results)
