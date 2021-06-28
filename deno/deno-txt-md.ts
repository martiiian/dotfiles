for await (const dirEntry of Deno.readDir('./')) {
  const [,fileName] = dirEntry.name.match(/([\d\w-_\.]*).txt/) || []

  if (fileName) {
    try {
      console.log(fileName)
      await Deno.rename(`${fileName}.txt`, `${fileName}.md`)
      console.log('Successfully renamed')
    } catch(e) {
      console.error('Error')
      console.log(e)
    }
  }
}

