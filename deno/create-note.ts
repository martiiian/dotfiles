function createNote() {
  const fileName: string = `${(new Date()).toLocaleDateString('ru')}.md`

  const path = Deno.env.get('NOTE_PATH')
  if (!path) return

  const dirs = Deno.readDir(path)

  async function checkDirExisting(): Promise<boolean> {
    for await (const { name: dirName } of dirs) {
      if (dirName === fileName) return true
    }
    return false
  }

  function openFile(fileName: string) {
    console.log(`Open file ${fileName}`)
    Deno.run({ cmd: ['nvim', `${path}/${fileName}`], stderr: 'piped' }).stderrOutput()
  }

  checkDirExisting().then((exist: boolean) => {
    if (exist) {
      console.log('File exist')
      openFile(fileName)
    } else {
      Deno.writeTextFile(fileName, '').then(() => {
        console.log('File successfully created')
        openFile(fileName)
      }).catch(() => {
        console.log('Error happened')
      })
    }
  })
}

createNote()
