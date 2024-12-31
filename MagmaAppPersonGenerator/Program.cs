using System.Text;
using Microsoft.Data.Sqlite;

namespace MagmaAppPersonGenerator;

class Program
{
    static void Main(string[] args)
    {
        int popCap = 1000;
        int role = 1;
        
        List<string> fNames = ReadFromFileToList("FNames.txt");
        List<string> sNames = ReadFromFileToList("SNames.txt");
        SqliteConnection connection = new("Data Source=../../../../MagmaAppDataGripFiles/MagmaAppDatabase.db");
        SqliteCommand command = connection.CreateCommand();
        Random random = new();
        StringBuilder sb = new();
        
        connection.Open();
        sb.Append("insert into Users (pesel_id, first_name, second_name, role_id, group_id) values ");
        
        for (int i = 0; i < popCap; i++)
        {
            string pesel = GeneratePesel(random);
            string fName = fNames[random.Next(0, fNames.Count)];
            string sName = sNames[random.Next(0, sNames.Count)];
            int group = random.Next(3, 23);
            
            sb.Append($"('{pesel}', '{fName}', '{sName}', {role}, {group}),");
        }

        sb.Remove(sb.Length - 1, 1);
        sb.Append(';');
        
        command.CommandText = sb.ToString();
        command.ExecuteNonQuery();
    }

    static string GeneratePesel(Random random)
    {
        string pesel = "";
        for (int i = 0; i < 11; i++) pesel += random.Next(0, 9);
        return pesel;
    }

    static List<string> ReadFromFileToList(string filePath)
    {
        List<string> list = new();
        StreamReader reader = new(filePath);
        while (!reader.EndOfStream) list.Add(reader.ReadLine() ?? "");
        return list;
    }
}