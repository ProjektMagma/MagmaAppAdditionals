using System.Text;
using Microsoft.Data.Sqlite;

namespace MagmaAppPersonGenerator;

class Program
{
    static void Main(string[] args)
    {
        List<string> fNames = ReadFromFileToList("FNames.txt");
        List<string> sNames = ReadFromFileToList("SNames.txt");
        SqliteConnection connection = new("Data Source=../../../../MagmaAppDataGripFiles/MagmaAppDatabase.db");
        connection.Open();

        GenerateUsers(connection, fNames, sNames, UserRole.Student, 200);
        GenerateUsers(connection, fNames, sNames, UserRole.Parent, 50);
        GenerateUsers(connection, fNames, sNames, UserRole.Teacher, 20);
        GenerateUsers(connection, fNames, sNames, UserRole.Principal, 1);
    }

    static void GenerateUsers(SqliteConnection connection, List<string> fNames,
        List<string> sNames, UserRole userRole, int popCap = 100)
    {
        SqliteCommand command = connection.CreateCommand();
        Random random = new();
        StringBuilder queryBuilder = new();

        connection.Open();
        queryBuilder.Append("insert into Users (pesel, first_name, second_name, role_id, group_id) values ");

        for (int i = 0; i < popCap; i++)
        {
            string pesel = GeneratePesel(random);
            string fName = fNames[random.Next(0, fNames.Count)];
            string sName = sNames[random.Next(0, sNames.Count)];
            int group = 0;
            switch (userRole)
            {
                case UserRole.Student:
                    group = random.Next(4, 24);
                    break;
                case UserRole.Parent:
                    group = 3;
                    break;
                case UserRole.Teacher:
                case UserRole.Principal:
                    group = 2;
                    break;
            }

            queryBuilder.Append($"('{pesel}', '{fName}', '{sName}', {(int)userRole}, {group}),");
        }

        queryBuilder.Remove(queryBuilder.Length - 1, 1);
        queryBuilder.Append(';');

        command.CommandText = queryBuilder.ToString();
        command.ExecuteNonQuery();
    }

    static string GeneratePesel(Random random)
    {
        StringBuilder peselBuilder = new();
        for (int i = 0; i < 11; i++) peselBuilder.Append(random.Next(0, 9));
        return peselBuilder.ToString();
    }

    static List<string> ReadFromFileToList(string filePath)
    {
        List<string> list = new();
        StreamReader reader = new(filePath);
        while (!reader.EndOfStream) list.Add(reader.ReadLine() ?? "");
        return list;
    }
}

enum UserRole
{
    Student = 1,
    Parent = 2,
    Teacher = 3,
    Principal = 4,
    Admin = 5
}