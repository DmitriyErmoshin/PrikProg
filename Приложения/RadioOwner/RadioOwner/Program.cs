﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace RadioOwner
{
    static class Program
    {
        /// <summary>
        /// Главная точка входа для приложения.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Form1());
        }
        public static string FindInfo(string input)
        {
            int b = input.IndexOf(':') + 2;
            input = input.Remove(0, b);
            int e = input.IndexOf('<');
            input = input.Remove(e);
            return input;
        }
    }
}
