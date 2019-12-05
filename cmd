using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.IO;
using System.Text;

namespace pliki_2
{
    class Program
    {
        static void Main(string[] args)
        {
            DirectoryInfo wsbDir = new DirectoryInfo(".");

            DirectoryInfo studentDir = new DirectoryInfo(@"C:\Users\Student");

            Console.WriteLine(studentDir.FullName);
            Console.WriteLine(studentDir.Name);
            Console.WriteLine(studentDir.Parent);
            Console.WriteLine(studentDir.Attributes);
            Console.WriteLine(studentDir.CreationTime);

            string[] customers =
            {
                "Anna Nowak",
                "JAnsuz Kowalski",
                "Tomasz Nowak"
            };
            //Directory.Delete(@"C:\Users\Student\C#File");

            string path = @"C:\Users\Student\C#File";

            try
            {
                if (Directory.Exists(path))
                {
                    Console.WriteLine("\n katalog isnieje");
                }
                else
                {
                    Directory.CreateDirectory("\\Users\\Student\\C#File");

                    string textFilePath = @"C:\Users\Student\C#File\testfile.txt";
                    File.WriteAllLines(textFilePath, customers);

                    Console.WriteLine("\nkatalog został utworzony: {0}", Directory.GetCreationTime(path));

                }

            }
            catch (Exception e)
            {
                Console.WriteLine("Error:{0}", e.ToString());
            }

            DirectoryInfo myDataDir = new DirectoryInfo(@path);
            Console.WriteLine();

            FileInfo[] txtFiles = myDataDir.GetFiles("*.txt", SearchOption.AllDirectories);

            Console.WriteLine("znaleziono plików *.txt: {0}", txtFiles.Length);

            if (Directory.Exists(path))
            {
                Console.WriteLine("\nCzy chcesz usunąć katalog z plikami? 1-true 0-false");
                string delete = Console.ReadLine();

                if (delete == "1")
                {
                    Directory.Delete(path, true);
                }

                if (!Directory.Exists(path))
                {
                    Console.WriteLine("katalog został usunięty!");
                }

                else
                {
                    Console.WriteLine("nie usunąłeś katalogu");
                }
            }

            Console.ReadKey();
        }
    }
}
