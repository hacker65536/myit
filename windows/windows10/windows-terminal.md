# Windows Terminal


https://github.com/microsoft/terminal



install
--

-> Microsoft Store  
search -> Windows Terminal(Preview)


require
 - 18362.0+


configuration
--


https://github.com/microsoft/terminal/issues/1509

```jsonnet
// To view the default settings, hold "alt" while clicking on the "Settings" button.
// For documentation on these settings, see: https://aka.ms/terminal-documentation

{
  '$schema': 'https://aka.ms/terminal-profiles-schema',

  defaultProfile: '{c6eaf9f4-32a7-5fdc-b5cf-066e8a4b1e40}',

  profiles:
    [
      {
        // Make changes here to the powershell.exe profile
        guid: '{61c54bbd-c2c6-5271-96e7-009a87ff44bf}',
        name: 'Windows PowerShell',
        commandline: 'powershell.exe',
        hidden: false,
      },
      {
        // Make changes here to the cmd.exe profile
        guid: '{0caa0dad-35be-5f56-a8ff-afceeeaa6101}',
        name: 'cmd',
        commandline: 'cmd.exe',
        hidden: false,
      },
      {
        guid: '{6e9fa4d2-a4aa-562d-b1fa-0789dc1f83d7}',
        hidden: false,
        name: 'Legacy',
        source: 'Windows.Terminal.Wsl',
      },
      {
        guid: '{c6eaf9f4-32a7-5fdc-b5cf-066e8a4b1e40}',
        hidden: false,
        name: 'Ubuntu-18.04',
        source: 'Windows.Terminal.Wsl',
        acrylicOpacity: 0.2,
        fontFace: 'DejaVu Sans Mono for Powerline',
        fontSize: 10,
        backgroundImageOpacity: 0.5,
        useAcrylic: false,
        startingDirectory: '%USERPROFILE%',
        colorScheme: 'Solarized Dark cmd-colors',
        snapOnInput: true,
      },
      {
        guid: '{b453ae62-4e3d-5e58-b989-0a998ec441b8}',
        hidden: false,
        name: 'Azure Cloud Shell',
        source: 'Windows.Terminal.Azure',
      },
    ],

  // Add custom color schemes to this array
  schemes: [
    {
      background: '#002B36',
      brightBlack: '#073642',
      brightBlue: '#268BD2',
      black: '#002B36',
      blue: '#839496',
      cyan: '#93A1A1',
      green: '#586E75',
      purple: '#6C71C4',
      red: '#CB4B16',
      white: '#FDF6E3',
      yellow: '#657B83',
      brightCyan: '#2AA198',
      foreground: '#839496',
      brightGreen: '#859900',
      name: 'Solarized Dark cmd-colors',
      brightPurple: '#D33682',
      brightRed: '#DC322F',
      brightWhite: '#EEE8D5',
      brightYellow: '#B58900',
    },
  ],

  // Add any keybinding overrides to this array.
  // To unbind a default keybinding, set the command to "unbound"
  keybindings: [],
}
```
