using System;
using System.Net;
using System.Text;

public class DiscordLogger
{
    public static void EnviarLog(string mensagem)
    {
        try
        {
            string webhook = "https://discordapp.com/api/webhooks/1483222226273829005/WaGXksiGQ6exNJ-aP8Fo93mqL0xGhL54aenEDqL0gXT-ndntZ8qY7mH_A8XGkbE40tXS";

            using (var client = new WebClient())
            {
                client.Headers.Add(HttpRequestHeader.ContentType, "application/json");

                string json = "{\"content\": \"" + mensagem + "\"}";

                client.UploadData(webhook, Encoding.UTF8.GetBytes(json));
            }
        }
        catch
        {
            // evita quebrar o sistema se o Discord falhar
        }
    }
}