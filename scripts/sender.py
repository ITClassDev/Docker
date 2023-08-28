from telethon import TelegramClient
from pathlib import Path
import pandas
import time

client = TelegramClient("sender_bulk", "APP_ID as INT", "API_KEY")

async def main():
    df = pandas.read_csv("send.csv")
    for index, row in df.iterrows():
        entity = row['telegram']
        if row['telegram'][0].isdigit():
            entity = await client.get_entity(row['telegram'])
        message = f"Доброго времени суток, {row['firstName']} {row['lastName']}! Мы рады, что вы вступили в ряды пользователей ShTP(ШТП)! Недавно вы заполняли форму регистрации. Данные для входа: {row['email']}: {row['password']}.\nP.S.Если не получается войти, то вы подумайте, может быть проблема на вашей стороне?"
        #print(entity, message)
        await client.send_message(entity, message)
        time.sleep(0.5)

with client:
    client.loop.run_until_complete(main())
